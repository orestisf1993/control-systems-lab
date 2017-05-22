function a = init_arduino(port)
if ~exist('port', 'var')
    port = instrhwinfo('serial');
    port = port.SerialPorts;
    n_ports = length(port);
    if n_ports > 0
        port = port{1};
        if n_ports > 1
            warning(['More than one serial ports found but will initialize only %s'], port);
        end
    else
        port = 'DEMO';
        warning('No serial ports found, initializing demo');
    end
end
a = arduino(port);
end
