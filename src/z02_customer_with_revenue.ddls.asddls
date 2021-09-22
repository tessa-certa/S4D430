@AbapCatalog.sqlViewName: 'Z02CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cds-view mit aggregation'
define view Z02_CUSTOMER_WITH_REVENUE
  as select from Z02_Booking_an_customer
{
  key customid        as id,
      name,
      street,
      postcode,
      city,
      country,
      @Semantics.amount.currencyCode: 'Currency'
      sum(amount)     as amount,
      currency,
      avg(days_ahead) as days_ahead
}
group by
  customid,
  name,
  street,
  postcode,
  city,
  country,
  currency
