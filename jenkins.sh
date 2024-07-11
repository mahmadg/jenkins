# Remove any existing Jenkins repo
sudo rm -f /etc/yum.repos.d/jenkins.repo
sudo dnf install java-11-openjdk-devel -y
dnf install wget -y
# Add Jenkins repo with correct GPG key
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# Clear yum cache
sudo yum clean all
# Install Jenkins
yum install jenkins -y
# Start and enable Jenkins service
systemctl daemon-reload
sudo chown -R jenkins:jenkins /var/lib/jenkins
sudo chown -R jenkins:jenkins /var/log/jenkins
sudo chown -R jenkins:jenkins /var/cache/jenkins
sudo systemctl start jenkins
systemctl enable jenkins
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
# Check Jenkins service status
cat /var/lib/jenkins/secrets/initialAdminPassword
