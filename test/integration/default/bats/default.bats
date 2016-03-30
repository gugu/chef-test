@test "nginx binary is found in PATH" {
  run which nginx
  [ "$status" -eq 0 ]
}

@test "php binary is found in PATH" {
  run which php
  [ "$status" -eq 0 ]
}

@test "jenkins is listening on 8080" {
  run curl http://localhost:8080/jenkins
  [ "$status" -eq 0 ]
}

@test "nginx is forwardng to jenkins" {
  run curl -k https://localhost/jenkins/
  [ "$status" -eq 0 ]
}

@test "nginx returns phpinfo.php" {
  run curl -k https://localhost/phpinfo.php
  [ "$status" -eq 0 ]
}
