children = [
  worker(DARMetaData, [DARMetaData]),
  worker(DARGfs, [DARGfs])
]
supervise children, strategy: :one_for_one
