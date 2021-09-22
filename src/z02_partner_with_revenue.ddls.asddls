@AbapCatalog.sqlViewName: 'Z02PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cds-view mit union anweisung'
define view Z02_Partner_with_revenue
  as select from Z02_CUSTOMER_WITH_REVENUE
{
  key id  as id,
      name,
      'c' as type,
      street,
      postcode,
      city,
      country,
      amount,
      currency,
      days_ahead
}
union select from S4d430_Agency_With_Revenue
{
  key id  as id,
      name,
      'a' as type,
      street,
      postcode,
      city,
      country,
      amount,
      currency,
      days_ahead
}
