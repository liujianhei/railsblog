# TopicsController 下所有页面的 JS 功能
window.Topics =
  replies_per_page: 50
  currentPageImageURLs : []

  # 往话题编辑器里面插入图片代码
  appendImageFromUpload : (srcs) ->
    txtBox = $(".topic-editor")
    src_merged = ""
    for src in srcs
      src_merged = "![](#{src})\n"
    source = txtBox.val()
    txtBox.focus()

  # 上传图片
  initUploader : () ->
    $("#topic_add_image").bind "click", () ->
      $(".topic-editor").focus()
      $("#topic-upload-images").click()
      return false

    opts =
      url : "/photos"
      type : "POST"
      beforeSend : () ->
        $("#topic_add_image").hide()
        $("#topic_add_image").before("<span class='loading'>上传中...</span>")
      success : (result, status, xhr) ->
        Topics.restoreUploaderStatus()
        Topics.appendImageFromUpload([result])
      error : (result, status, errorThrown) ->
        Topics.restoreUploaderStatus()
        alert(errorThrown)


    $("#topic-upload-images").fileUpload opts
    return false

  restoreUploaderStatus : () ->
    $("#topic_add_image").parent().find("span.loading").remove()
    $("#topic_add_image").show()

    
  # 图片点击增加全屏预览功能
  initContentImageZoom : () ->    
    exceptClasses = ["emoji"]
    imgEls = $(".body img")
    for el in imgEls
      if exceptClasses.indexOf($(el).attr("class")) == -1
        $(el).wrap("<a href='#{$(el).attr("src")}' class='zoom-image' data-action='zoom'></a>")
      
    # Bind click event
    $('a.zoom-image').fluidbox
      overlayColor: "#FFF"
    true

  preview: (body) ->
    $("#preview").text "Loading..."

    $.post "/topics/preview",
      "body": body,
      (data) ->
        $("#preview").html data.body
      "json"

  hookPreview: (switcher, textarea) ->
    # put div#preview after textarea
    preview_box = $(document.createElement("div")).attr "id", "preview"
    preview_box.addClass("markdown-body")
    $(textarea).after preview_box
    preview_box.hide()

    $(".edit a",switcher).click ->
      $(".preview",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).hide()
      $(textarea).show()
      false
    $(".preview a",switcher).click ->
      $(".edit",switcher).removeClass("active")
      $(this).parent().addClass("active")
      $(preview_box).show()
      $(textarea).hide()
      Topics.preview($(textarea).val())
      false

  initCloseWarning: (el, msg) ->
    return false if el.length == 0
    msg = "离开本页面将丢失未保存页面!" if !msg
    $("input[type=submit]").click ->
      $(window).unbind("beforeunload")
    el.change ->
      if el.val().length > 0
        $(window).bind "beforeunload", (e) ->
          if $.browser.msie
            e.returnValue = msg
          else
            return msg
      else
        $(window).unbind("beforeunload")

  favorite : (el) ->
    topic_id = $(el).data("id")
    if $(el).hasClass("small_bookmarked")
      $.ajax
        url : "/topics/#{topic_id}/unfavorite"
        type : "DELETE"
      $(el).attr("title","收藏")
      $(el).attr("class","icon small_bookmark")
    else
      $.post "/topics/#{topic_id}/favorite"
      $(el).attr("title","取消收藏")
      $(el).attr("class","icon small_bookmarked")
    false

  follow : (el) ->
    topic_id = $(el).data("id")
    followed = $(el).data("followed")
    if followed
      $.ajax
        url : "/topics/#{topic_id}/unfollow"
        type : "DELETE"
      $(el).data("followed", false)
      $("i",el).attr("class", "icon small_follow")
    else
      $.ajax
        url : "/topics/#{topic_id}/follow"
        type : "POST"
      $(el).data("followed", true)
      $("i",el).attr("class", "icon small_followed")
    false

  submitTextArea : (el) ->
    if $(el.target).val().trim().length > 0
      $("#reply > form").submit()
    return false

  # 往话题编辑器里面插入代码模版
  appendCodesFromHint : (language='') ->
    txtBox = $(".topic-editor")
    caret_pos = txtBox.caret('pos')
    prefix_break = ""
    if txtBox.val().length > 0
      prefix_break = "\n"
    src_merged = "#{prefix_break }```#{language}\n\n```\n"
    source = txtBox.val()
    before_text = source.slice(0, caret_pos)
    txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
    txtBox.caret('pos',caret_pos + src_merged.length - 5)
    txtBox.focus()

  init : ->
    bodyEl = $("body")
    





    Topics.initUploader()


    # also highlight if hash is reply#

    # pick up one lang and insert it into the textarea

    # @ Reply

    # Focus title field in new-topic page

$(document).ready ->
    Topics.init()
