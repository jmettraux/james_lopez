
class StatusController < ApplicationController

  def index

    a = []

    Thread.list.each do |t|
      a << '-' * 80
      a << ''
      a << t.inspect
      a << ''
      a.concat(t.backtrace[0, 14])
    end

    a << '-' * 80

    render :text => a.join("\n") + "\n"
  end
end

