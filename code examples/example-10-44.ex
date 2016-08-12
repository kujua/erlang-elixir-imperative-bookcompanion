alias Experimental.GenStage

defmodule Kitchen do
  use GenStage

  def init({maxpizza,maxpasta,maxsalad}) do
    {:producer, {maxpizza,maxpasta,maxsalad}}
  end

  def handle_demand(demand, {maxpizza,maxpasta,maxsalad}) do
    {event,state} = case demand do
      :pizza -> {:servepizza,{maxpizza-1,maxpasta,maxsalad}}
      :pasta -> {:servepasta,{maxpizza,maxpasta-1,maxsalad}}
      :salad -> {:servesalad,{maxpizza,maxpasta,maxsalad-1}}
      _ -> {:nothingtoserve, {maxpizza,maxpasta,maxsalad}}
    end
    {:noreply, [event], state}
  end
end

defmodule Service do
  use GenStage

  def init(state \\ :idle) do
    {:producer_consumer, state}
  end

  def handle_events(event, _from, state) do
    event = case event do
      :servepizza -> :pizzaserved
      :servepasta -> :pastaserved
      :servesalad -> :saladserved
      _ -> :nothingserved
    end
    {:noreply, [event], state}
  end
end
