@AbapCatalog.sqlViewName: 'Z02_ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: Inner Join and Selection'
@AbapCatalog.buffering: {
    status: #ACTIVE,
    type: #GENERIC,
    numberOfKeyFields: 4
}
define view Z02_Annotations
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.class,
      b.forcuram  as amount @<Semantics.amount.currencyCode: 'currency',
      b.forcurkey as currency @<Semantics.currencyCode: true,
      b.luggweight @<Semantics.quantity.unitOfMeasure: 'wunit',
      b.wunit @<Semantics.unitOfMeasure: true,
      b.order_date,
      b.agencynum,
      b.counter,
      b.customid,
      c.name,
      c.street,
      c.postcode,
      c.city,
      c.country
}
where
  cancelled <> 'X'
