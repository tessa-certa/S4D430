@AbapCatalog.sqlViewAppendName: 'Z02EXTENSION2'
@EndUserText.label: 'CDS-View erweitern'
extend view Z02_AUTHORIZATIONS with Z02_EXTENSION_FOR_DCL_TASK association to spfli as _connection
                             on b.carrid = _connection.carrid 
                             and b.connid = _connection.connid{
    b.counter as extension_counter,
    b.class as extension_class,
    _connection 
}
