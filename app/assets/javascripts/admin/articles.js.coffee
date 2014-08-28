# TopicsController 下所有页面的 JS 功能
window.Topics =
  replies_per_page: 50
  currentPageImageURLs : []

  # 往话题编辑器里面插入图片代码
  appendImageFromUpload : (srcs) ->
    txtBox = $(".topic-editor")
    caret_pos = txtBox.caret('pos')
    src_merged = ""
    for src in srcs
      src_merged = "![](#{src})\n"
    source = txtBox.val()
    before_text = source.slice(0, caret_pos)
    txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
    txtBox.caret('pos',caret_pos + src_merged.length)
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



  init : ->
    bodyEl = $("body")
    


    $("textarea").bind "keydown","ctrl+return",(el) ->
      return Topics.submitTextArea(el)

    $("textarea").bind "keydown","Meta+return",(el) ->
      return Topics.submitTextArea(el)


    Topics.initUploader()


$(document).ready ->
    Topics.init()
