RSA="\033[31m"
YSA="\033[1;93m"
CEA="\033[0m"
WHS="\033[0;97m"

WHO="$( whoami )"

if [[ "$WHO" != "root" ]]
then
    echo -e ""$RSA"[-]"$WHS" [Errno 1] Failed to copy files: Operation not permitted"$CEA""
    exit
exit
fi

if [[ -d ~/GeoSpy ]]
then
cd ~/GeoSpy
{
cp bin/geospy /usr/local/bin
chmod +x /usr/local/bin/geospy
cp bin/geospy /bin
chmod +x /bin/geospy
python -m pip install -r requirements.txt
} &> /dev/null
else
cd ~
{
git clone https://github.com/entynetproject/GeoSpy.git
cd  ~/GeoSpy
cp bin/geospy /usr/local/bin
chmod +x /usr/local/bin/geospy
cp bin/geospy /bin
chmod +x /bin/geospy
python -m pip install -r requirements.txt
} &> /dev/null
fi
