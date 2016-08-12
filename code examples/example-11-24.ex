case :rpc.call(
         :"dargfslib@Wolfgangs-MacBook-Pro",
         :dar_gfslib_process_files,
         :read_from_gfs,
         ['filetestwrite','dar']) do
   {:ok, f, fname} -> f
   {:badrpc, reason} -> {:error, {:badrpc, reason}}
   _ -> {:error, {:call, "Call failed"}
 end
