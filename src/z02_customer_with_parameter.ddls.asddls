@AbapCatalog.sqlViewName: 'Z02CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'cds-view mit eingabeparamtern'
define view Z02_Customer_with_parameter
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    p_date : dats
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
where
  fldate < $parameters.p_date
group by
  customid,
  name,
  street,
  postcode,
  city,
  country,
  currency
