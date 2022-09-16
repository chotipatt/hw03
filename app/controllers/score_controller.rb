class ScoreController < ApplicationController

  def list
    @n = params[:n]
    @is_delete = params[:delete]
    @id = params[:id]
    @subjectlist = Subject.all
    max = 0
    idx = 0
    sum = 0

    if !@is_delete.blank? && @is_delete
      Subject.find(@id).destroy
    end

    for sub in @subjectlist
      sum += sub.score
      if sub.score > max
        max = sub.score
        idx = sub.id
      end
    end

    @maxsubject = Subject.find(idx).name
    @totalscore = sum

  end

  def edit
    @n = params[:n]
    @name = params[:name]
    @score = params[:score]

    a = Subject.where(name:@name , score:@score)
    @id = a[0].id

    puts "------------\n edit controller = #{@id} \n---------------"
  end

  def update
    @n = params[:n]
    editname = params[:editname]
    editscore = params[:editscore]
 

    id = params[:id]

    puts "------------\n editname = #{editname} , id  = #{id} \n---------------"

    a = Subject.find(id)
    
    if !editname.blank? 
      a.update(name:editname)
    end

    if !editscore.blank? 
      a.update(score:editscore)
    end

    redirect_to action: 'list' ,n:@n and return

  end

end
