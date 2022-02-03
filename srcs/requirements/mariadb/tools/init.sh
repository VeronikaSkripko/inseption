if	[ ! -d "var/lib/mysql/wordpress" ]; then
		echo "123"
		service mysql start
		mysql -u root  < tmp.sql
		mysqladmin -u root password 123
		service mysql stop
		echo "123"
fi
/usr/bin/mysqld_safe
cat /var/log/mysql/error.log
