import jenkins.model.*

def env = System.getenv()

Jenkins.instance.setNumExecutors(env.JENKINS_EXECUTORS_NUM as int)