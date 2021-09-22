@AbapCatalog.sqlViewName: 'Z02FUNC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: Inner Join and Selection'
@AbapCatalog.buffering: {
    status: #ACTIVE,
    type: #GENERIC,
    numberOfKeyFields: 4
}
define view Z02_Functions
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.class,
      currency_conversion( amount => b.forcuram,
                           source_currency => b.forcurkey,
                           target_currency => cast( 'USD' as abap.cuky ),
                           exchange_rate_type =>'M',
                           exchange_rate_date => b.order_date ) as amount,
      'USD'                                                   as currency,
      b.luggweight @<Semantics.quantity.unitOfMeasure: 'wunit',
      b.wunit @<Semantics.unitOfMeasure: true,
      b.order_date,
      dats_days_between(b.order_date, b.fldate)               as days_ahead,
      b.agencynum,
      b.counter,
      b.customid,
      division(cast(c.discount as int4), 100, 2)              as discount,
      concat_with_space(c.form, c.name,1)                     as name,
      c.street,
      c.postcode,
      c.city,
      c.country
}
where
  cancelled <> 'X'
