# coding: utf-8
class PhotosController < ApplicationController

  def create
    # 浮动窗口上传
    @photo = Photo.new
    puts params[:Filedata]
    #@photo.url = params[:Filedata]
    @photo.save
    render text: @photo.url
  end
end
