$(document).ready(function()
{
    $(".display-on-scroll .content").hide()
    
    $(window).on("scroll", function()
    {
        for(let i = 1; i <= $(".display-on-scroll").length; i++)
        {
            if($(window).scrollTop() >= $(".scroll-n-"+i).offset().top-650)
            {
                if(!$(".scroll-n-"+i+" .content").is(":visible"))
                {
                    $(".scroll-n-"+i+" .content").fadeIn(3500);
                }
            }
        }
    })
});