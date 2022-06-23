date
echo "init_job.sh -> Waiting for exe"

sleep 60

date
echo "init_job.sh -> replace jenkins config"
rm -fr $JENKINS_HOME/jobs
cp -r jobs $JENKINS_HOME/

date
echo "init_job.sh -> download jenkins cli"
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

date
echo "init_job.sh -> reload jenkins config"
java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration

curl -X POST -F 'NODE_ID=111' http://localhost:8080/job/internal_notify_start_task/build?token=123123
