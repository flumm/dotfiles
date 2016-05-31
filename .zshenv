function pushdebto()
{
    REMOTEMACHINE="192.168.15.71"
    if [ $1 ]; then
	REMOTEMACHINE="$1";
    fi
    sudo make deb
    if [ $? -ne 0 ]; then
	sudo make
    fi
    scp *.deb root@$REMOTEMACHINE:~/
    ssh -o "BatchMode=yes" -t root@$REMOTEMACHINE "dpkg -i *.deb ; rm *.deb"
}
