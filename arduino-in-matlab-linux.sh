pacaur -S java-rxtx
sudo gpasswd -a $USER uucp #dialout
sudo gpasswd -a $USER lock
i3-msg exit # Log out

MATLAB_PATH="$HOME/bin/R2013B"

cd "$MATLAB_PATH"/bin/glnxa64/
mv librxtxSerial.so{,.bak}
ln -s /usr/lib/librxtxSerial.so

cd "$MATLAB_PATH"/java/jarext
mv RXTXcomm.jar{,.bak}
ln -s /usr/share/java/rxtx/RXTXcomm.jar

export _JAVA_OPTIONS="$_JAVA_OPTIONS -Dgnu.io.rxtx.SerialPorts=/dev/ttyACM0:/dev/ttyACM1:/dev/ttyS0:/dev/ttyUSB0:/dev/ttyUSB1:/dev/ttyUSB2"
matlab
