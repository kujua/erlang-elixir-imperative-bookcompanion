defmodule MyServer do
      @my_data 14
      def first_data, do: @my_data
      @my_data 13
      def second_data, do: @my_data
    end

    MyServer.first_data #=> 14
    MyServer.second_data #=> 13