class MainController < ApplicationController

  def test
    @num = params[:amount].to_i
    @is_blank = params[:is_blank]
    @subname = params[:subname]
    @subscore = params[:subscore]
    # arr = Array.new()
    # if arr.length != 0
    #   @arrsub = params[:sub]
    #   @arrscore = params[:score]
  end

  def home

  end

  def check
    @n = params[:n]
    @subname = params[:subject][:name]
    @subscore = params[:subject][:score]
    @is_blank = Array.new()
    @length = @subname.length.to_i

    for i in 0..@length do 
      if @subname[i] == "" || @subscore[i] == ""
        # redirect_to :action => 'test' , amount: @length and return
        @is_blank.push(i)
      end
    end

    if !@is_blank.blank?
      redirect_to action: 'test', is_blank: @is_blank, amount: @length, subname: @subname, subscore: @subscore and return
    end


     #---------- save suibject -------------
     @subarr = @subname.zip(@subscore)
     for x in @subarr do
        a = Subject.where(name:x[0])
        if a.blank?
          Subject.create(name:x[0] , score:x[1])
        else
          puts "------- #{a[0].name} ---------"
          s = a[0]
          s.update(score:x[1])
        end
     end
     #-------------------------------- 


    sum = 0
    max = 0
    idx = 0
    for i in 0..@length do
      if @subscore[i] == ""
        sum += 0
      else 
        sum += @subscore[i].to_i
      end

      if @subscore[i].to_i > max 
        max = @subscore[i].to_i
        idx = i
      end

    end

    @totalscore = sum
    @maxsub = @subname[idx]
    render 'cal'
    # redirect_to :action => 'cal' , sum: @totalscore , mx: @subname[idx] and return
  end

end
