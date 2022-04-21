# This allows the user to log into the centos provisioning account
# with their provided keys. This is needed to debug if,
# for example,ansible fails to run.
cat >> /home/centos/.ssh/authorized_keys <<EOF
${citc_keys}
EOF
dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y epel-release
dnf config-manager --set-enabled PowerTools
hostnamectl set-hostname mgmt.${dns_zone}
