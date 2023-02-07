node {
    checkout scm

    stage("Clone") {
        git branch: 'master', url: 'https://github.com/Jd-Bob/siooka-config-server.git'
    }

    stage("Build") {
        stage("java package") {
            sh "./mvnw clean install"
        }
        stage("java package") {
            sh "docker stop demo"
            sh "docker rmi demo"
        }
        stage("docker image") {
            def customImage = docker.build("demo", ".")
        }
    }

    stage("Continue Integration") {
        stage("Runing unit tests") {
            sh "./mvnw test -Punit"
        }
    }

    stage("Continue Deployment") {
        options {
            timeout(time: 10, unit: "SECONDS")
        }

        stage("Deployment") {
            sh "docker run -p 8888:8888 demo"
        }
    }
}
