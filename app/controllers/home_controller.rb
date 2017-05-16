class HomeController < ApplicationController
  def index
  end
  
  def write
    new_post = Post.new
    new_post.content = params[:content]
    new_post.save
    
    redirect_to"/list"
  end
  
  def list
    @every_post = Post.all
  end
  
  def destroy
    @one_post = Post.find(params[:post_id])
    @one_post.destroy
    redirect_to "/list"
  end
  
  def update_view
    @one_post = Post.find(params[:post_id])
  end
  
  def update
    @one_post = Post.find(params[:post_id])
    @one_post.content = params[:content]
    @one_post.save
    redirect_to "/list"
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:content]
    reply.post_id = params[:id_of_post]
    reply.save
    redirect_to '/list'
  end
  
  def reply_destroy
    @one_reply = Reply.find(params[:reply_id])
    @one_reply.destroy
    redirect_to "/list"
  end
  
  def update_view_reply
    @one_reply = Reply.find(params[:reply_id])
  end
  
  
  def reply_update
    @one_reply = Reply.find(params[:reply_id])
    @one_reply.content = params[:content]
    
    #수정할 때 post_id에 대한 정보도 넘겨줘야 하므로 아래 코드도 추가되어야 해용
    @one_reply.post_id = params[:id_of_post]
    
    @one_reply.save
    redirect_to "/list"
  end
end
