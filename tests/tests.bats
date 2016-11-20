@test "Opening Deluge on port 8112" {
  run curl http://localhost:8112
  [ "${status}" -eq 0 ]
}
