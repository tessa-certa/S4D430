@AbapCatalog.sqlViewName: 'Z02EXTENDED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: Functions'
define view Z02_EXTENDED
  as select from Z02_Booking as b
  association [1] to Z02_Customer as _Customer on $projection.customid = _Customer.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      class,
      amount,
      currency,
      b.luggweight,
      b.wunit,
      b.order_date,
      days_ahead,
      b.agencynum,
      b.counter,
      b.customid,
      //      c.name,
      //      c.street as street,
      //      c.postcode as postcode,
      //      c.city as city,
      //      c.country as country,
      //      c.discount
      _Customer
}
