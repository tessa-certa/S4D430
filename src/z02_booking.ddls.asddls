@AbapCatalog.sqlViewName: 'Z02BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: Functions'
define view Z02_Booking
  as select from sbook as b

{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      case b.class
       when 'Y' then 'Economy'
       when 'C' then 'Business'
       when 'F' then 'First'
       else '???'
      end                                                    as class,
      currency_conversion( amount          => b.forcuram,
                           source_currency => b.forcurkey,
                           round           => 'X',
                           target_currency => cast( 'USD' as abap.cuky),
                           exchange_rate_type => 'M',
                           exchange_rate_date => b.order_date,
                        error_handling => 'SET_TO_NULL'    ) as amount @<Semantics.amount.currencyCode:'CURRENCY',
      cast('USD' as abap.cuky)                               as currency @<Semantics.currencyCode: true,
      b.luggweight @<Semantics.quantity.unitOfMeasure: 'WUNIT',
      b.wunit @<Semantics.unitOfMeasure: true,
      b.order_date,
      dats_days_between(b.order_date, b.fldate)              as days_ahead,
      b.agencynum,
      b.counter,
      b.customid

}
where
  cancelled <> 'X'
