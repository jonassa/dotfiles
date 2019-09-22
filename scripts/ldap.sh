#! /usr/bin/bash

touch brukere.ldif

echo -n "Neste ledige uidNumber: "
read uidnumber
uidnumber="$(echo -e "${uidnumber}" | sed -e 's/[[:space:]]*$//')"

loop=y

while [ "$loop" == "y" ]; do
	echo Ny bruker i LDAP
	echo -n "Fornavn: "
	read fornavn
	fornavn="$(echo -e "${fornavn}" | sed -e 's/[[:space:]]*$//')"
	echo -n "Etternavn: "
	read etternavn
	etternavn="$(echo -e "${etternavn}" | sed -e 's/[[:space:]]*$//')"
	echo -n "uid: "
	read uid
	uid="$(echo -e "${uid}" | sed -e 's/[[:space:]]*$//')"

	echo "dn: uid=$uid,ou=People,dc=timini,dc=no" >> brukere.ldif
	echo "objectClass: posixAccount" >> brukere.ldif
	echo "objectClass: inetOrgPerson" >> brukere.ldif
	echo "objectClass: organizationalPerson" >> brukere.ldif
	echo "objectClass: person" >> brukere.ldif
	echo "cn: $fornavn $etternavn" >> brukere.ldif
	echo "givenName: $fornavn" >> brukere.ldif
	echo "sn: $etternavn" >> brukere.ldif
	echo "uid: $uid" >> brukere.ldif
	echo "homeDirectory: /home/$uid" >> brukere.ldif
	echo "loginShell: /bin/bash" >> brukere.ldif
	echo "uidNumber: $uidnumber" >> brukere.ldif
	echo "gidNumber: 1010" >> brukere.ldif
	echo >> brukere.ldif

	let uidnumber+=1	
	
	echo "Vil du legge til flere? (y/n)"
	read loop
done

less brukere.ldif
echo Er du sikker på at du vil legge til disse brukerene?

select svar in "y" "n"
do
	if [ "$svar" == "y" ]; then
		ldapadd -x -W -D "cn=admin,dc=timini,dc=no" -f brukere.ldif
	else
		echo "Avslutter uten å legge til"
		exit 1
	fi
	break
done

rm brukere.ldif
exit 0

