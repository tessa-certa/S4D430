@AbapCatalog.sqlViewAppendName: 'Z02EXTENSION'
@EndUserText.label: 'CDS-View erweitern'
extend view Z02_EXTENDED with Z02_Extension association to spfli as _connection
                             on b.carrid = _connection.carrid 
                             and b.connid = _connection.connid{
    b.counter as extension_counter,
    b.class as extension_class,
    _connection 
}
