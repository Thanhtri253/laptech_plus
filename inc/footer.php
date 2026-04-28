<script>
  $(document).ready(function(){
    $('#p_use').click(function(){
      uni_modal("Privacy Policy","policy.php","mid-large")
    })
     window.viewer_modal = function($src = ''){
      start_loader()
      var t = $src.split('.')
      t = t[1]
      if(t =='mp4'){
        var view = $("<video src='"+$src+"' controls autoplay></video>")
      }else{
        var view = $("<img src='"+$src+"' />")
      }
      $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
      $('#viewer_modal .modal-content').append(view)
      $('#viewer_modal').modal({
              show:true,
              backdrop:'static',
              keyboard:false,
              focus:true
            })
            end_loader()  

  }
    window.uni_modal = function($title = '' , $url='',$size=""){
        start_loader()
        $.ajax({
            url:$url,
            error:err=>{
                console.log()
                alert("An error occured")
            },
            success:function(resp){
                if(resp){
                    $('#uni_modal .modal-title').html($title)
                    $('#uni_modal .modal-body').html(resp)
                    if($size != ''){
                        $('#uni_modal .modal-dialog').addClass($size+'  modal-dialog-centered')
                    }else{
                        $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
                    }
                    $('#uni_modal').modal({
                      show:true,
                      backdrop:'static',
                      keyboard:false,
                      focus:true
                    })
                    end_loader()
                }
            }
        })
    }
    window._conf = function($msg='',$func='',$params = []){
       $('#confirm_modal #confirm').attr('onclick',$func+"("+$params.join(',')+")")
       $('#confirm_modal .modal-body').html($msg)
       $('#confirm_modal').modal('show')
    }
  })
</script>
<script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <script src="<?php echo base_url ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url ?>plugins/chart.js/Chart.min.js"></script>
    <script src="<?php echo base_url ?>plugins/sparklines/sparkline.js"></script>
    <script src="<?php echo base_url ?>plugins/select2/js/select2.full.min.js"></script>
    <script src="<?php echo base_url ?>plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="<?php echo base_url ?>plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <script src="<?php echo base_url ?>plugins/jquery-knob/jquery.knob.min.js"></script>
    <script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
    <script src="<?php echo base_url ?>plugins/daterangepicker/daterangepicker.js"></script>
    <script src="<?php echo base_url ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/summernote/summernote-bs4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="<?php echo base_url ?>dist/js/adminlte.js"></script>
    <div class="daterangepicker ltr show-ranges opensright">
      <div class="ranges">
        <ul>
          <li data-range-key="Today">Today</li>
          <li data-range-key="Yesterday">Yesterday</li>
          <li data-range-key="Last 7 Days">Last 7 Days</li>
          <li data-range-key="Last 30 Days">Last 30 Days</li>
          <li data-range-key="This Month">This Month</li>
          <li data-range-key="Last Month">Last Month</li>
          <li data-range-key="Custom Range">Custom Range</li>
        </ul>
      </div>
      <div class="drp-calendar left">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-calendar right">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-buttons"><span class="drp-selected"></span><button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button><button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button> </div>
    </div>
    <div class="jqvmap-label" style="display: none; left: 1093.83px; top: 394.361px;">Idaho</div>
    
    <style>
    /* Nút mở chat tròn tròn ở góc phải */
    .chat-toggler {
        position: fixed;
        bottom: 30px;
        right: 30px;
        height: 50px;
        width: 50px;
        background: #007bff;
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        z-index: 9999;
        font-size: 24px;
        transition: all 0.3s ease;
    }
    .chat-toggler:hover { transform: scale(1.1); }

    /* Khung chat chính */
    .chatbot-container {
        position: fixed;
        bottom: 90px;
        right: 30px;
        width: 320px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
        overflow: hidden;
        opacity: 0;
        pointer-events: none;
        transform: translateY(20px);
        transition: all 0.3s ease;
        z-index: 9999;
        display: flex;
        flex-direction: column;
        font-family: Arial, sans-serif;
    }
    body.show-chatbot .chatbot-container {
        opacity: 1;
        pointer-events: auto;
        transform: translateY(0);
    }

    .chatbot-header {
        background: #007bff;
        padding: 15px;
        color: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .chatbot-header h4 { margin: 0; font-size: 16px; }
    .close-btn { cursor: pointer; font-size: 20px; }

    .chatbox {
        height: 300px;
        overflow-y: auto;
        padding: 15px;
        background: #f4f7f6;
    }
    .chatbox li {
        list-style: none;
        margin-bottom: 10px;
    }
    .chatbox .chat p {
        padding: 10px 15px;
        border-radius: 10px;
        max-width: 75%;
        font-size: 0.9rem;
        word-wrap: break-word;
    }
    .chatbox .outgoing {
        display: flex;
        justify-content: flex-end;
    }
    .chatbox .outgoing p {
        background: #007bff;
        color: white;
        border-bottom-right-radius: 0;
    }
    .chatbox .incoming {
        display: flex;
        justify-content: flex-start;
    }
    .chatbox .incoming p {
        background: #e2e2e2;
        color: black;
        border-bottom-left-radius: 0;
    }

    .chat-input {
        padding: 10px;
        border-top: 1px solid #ddd;
        display: flex;
        background: #fff;
    }
    .chat-input textarea {
        width: 100%;
        border: none;
        outline: none;
        resize: none;
        height: 40px;
        padding: 10px;
        font-size: 0.95rem;
    }
    .chat-input span {
        color: #007bff;
        cursor: pointer;
        font-size: 1.2rem;
        align-self: flex-end;
        margin-bottom: 10px;
    }
</style>

<div class="chat-toggler">
    <i class="fas fa-comment-dots"></i>
</div>

<div class="chatbot-container">
    <div class="chatbot-header">
        <h4>LapTech+ Assistant</h4>
        <span class="close-btn">&times;</span>
    </div>
    <ul class="chatbox">
        <li class="chat incoming">
            <p>Hello! 👋<br>How can I help you today?</p>
        </li>
    </ul>
    <div class="chat-input">
        <textarea placeholder="Type a message..."></textarea>
        <span id="send-btn"><i class="fas fa-paper-plane"></i></span>
    </div>
</div>

<script>
    const chatbotToggler = document.querySelector(".chat-toggler");
    const closeBtn = document.querySelector(".close-btn");
    const chatbox = document.querySelector(".chatbox");
    const chatInput = document.querySelector(".chat-input textarea");
    const sendChatBtn = document.querySelector("#send-btn");

    let userMessage;

    const createChatLi = (message, className) => {
        const chatLi = document.createElement("li");
        chatLi.classList.add("chat", className);
        let chatContent = className === "outgoing" 
            ? `<p>${message}</p>` 
            : `<p>${message}</p>`;
        chatLi.innerHTML = chatContent;
        return chatLi;
    }

    // LOGIC TRẢ LỜI TỰ ĐỘNG (ENGLISH VERSION)
    const generateResponse = (incomingChatLi) => {
        const messageElement = incomingChatLi.querySelector("p");
        
        const userText = userMessage.toLowerCase();
        
        // Câu trả lời mặc định khi không hiểu
        let botResponse = "Sorry, I didn't understand that. Please contact our support hotline.";

        // Các từ khóa và câu trả lời bằng tiếng Anh
        if (userText.includes("hello") || userText.includes("hi") || userText.includes("hey")) {
            botResponse = "Hello there! Welcome to LapTech+. How can I assist you?";
        } else if (userText.includes("price") || userText.includes("cost") || userText.includes("how much")) {
            botResponse = "Our product prices are listed on the website. Which model are you interested in?";
        } else if (userText.includes("warranty") || userText.includes("guarantee")) {
            botResponse = "We offer a 12-month warranty for Laptops and 24 months for PC builds!";
        } else if (userText.includes("address") || userText.includes("location") || userText.includes("where")) {
            botResponse = "LapTech+ is located in Ho Chi Minh City. Come visit our store!";
        } else if (userText.includes("black friday") || userText.includes("sale") || userText.includes("discount") || userText.includes("promotion")) {
            botResponse = "We have a huge Black Friday sale! Use code BLACKWINBIG for up to 40% OFF.";
        } else if (userText.includes("shipping") || userText.includes("delivery")) {
            botResponse = "We offer nationwide delivery. Free shipping for orders over $500.";
        } 

        setTimeout(() => {
            messageElement.textContent = botResponse;
            chatbox.scrollTo(0, chatbox.scrollHeight);
        }, 600);
    }

    const handleChat = () => {
        userMessage = chatInput.value.trim();
        if(!userMessage) return;

        chatbox.appendChild(createChatLi(userMessage, "outgoing"));
        chatbox.scrollTo(0, chatbox.scrollHeight);
        chatInput.value = "";

        setTimeout(() => {
            const incomingChatLi = createChatLi("Typing...", "incoming");
            chatbox.appendChild(incomingChatLi);
            chatbox.scrollTo(0, chatbox.scrollHeight);
            generateResponse(incomingChatLi);
        }, 600);
    }

    sendChatBtn.addEventListener("click", handleChat);
    chatInput.addEventListener("keydown", (e) => {
        if(e.key === "Enter" && !e.shiftKey && window.innerWidth > 800) {
            e.preventDefault();
            handleChat();
        }
    });
    chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));
    closeBtn.addEventListener("click", () => document.body.classList.remove("show-chatbot"));
</script>