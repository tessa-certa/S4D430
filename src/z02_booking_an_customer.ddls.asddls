@AbapCatalog.sqlViewName: 'Z02BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: Functions'
define view Z02_Booking_an_customer
  as select from Z02_Booking  as b
    inner join   Z02_Customer as c on b.customid = c.id
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
      name,
      c.street as street,
      c.postcode as postcode,
      c.city as city,
      c.country as country,
      discount
}
