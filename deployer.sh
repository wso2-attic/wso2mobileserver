cd /Users/dulitharasangawijewantha/Development/WSO2/wso2mobile-server
if [ "$1" != "" ]; then
	echo "Building product with maven"
    mvn clean install -Dmaven.test.skip=true -o
else
	echo "Not building product with Maven"
fi
cp /Users/dulitharasangawijewantha/Development/WSO2/wso2mobile-server/modules/distribution/target/wso2mobileserver-1.0.0.zip /Users/dulitharasangawijewantha/Development/WSO2/Products/
cd /Users/dulitharasangawijewantha/Development/WSO2/Products/
rm -rf /Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0/
unzip wso2mobileserver-1.0.0.zip
rm /Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0.zip
rm -rf /Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0/repository/deployment/server/jaggeryapps/
mkdir /Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0/repository/deployment/server/jaggeryapps
cd /Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0/repository/deployment/server/jaggeryapps
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/ROOT ROOT
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/mdm mdm
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/publisher publisher
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/store store
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/sso sso
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/social social
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/store-admin store-admin
ln -s /Users/dulitharasangawijewantha/Development/WSO2/apps/assets assets
