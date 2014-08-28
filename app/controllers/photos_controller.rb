# coding: utf-8
class PhotosController < ApplicationController

  def create
    # 浮动窗口上传
    @photo = Photo.new
    @photo.image = params[:Filedata]
    @photo.save
    render text: @photo.image.url
  end
end
