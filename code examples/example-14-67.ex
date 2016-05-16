defmodule NestedMaps do

  def nested_map() do
    %{"configs" =>
      [
        [%{"kind" => "compute#accessConfig",
         "name" => "External NAT",
         "natIP" => ["146.148.0.0","127.0.0.1"],
         "type" => "ONE_TO_ONE_NAT"}
        ],
        [{:otherconfig,"Router"}]
      ]
     }
  end

  def get_nested_list(nm) do
    %{"configs" => nestedmaplist} = nm
    nestedmaplist
  end

  def get_nested_map_from_list(nm, nestedlevel) when nestedlevel < 1 do
    nm
  end

  def get_nested_map_from_list(nm, nestedlevel) do
    l = List.first(nm)
    get_nested_map_from_list(l,nestedlevel-1)
  end

  def get_nested_map_value(nm, val) do
    Map.get nm,val
  end
end
