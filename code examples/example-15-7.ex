

query = from w in Weather,
         where: w.prcp > 0 or is_nil(w.prcp),
         select: w
