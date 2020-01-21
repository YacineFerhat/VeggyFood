let paths = ["images/legume1.jpg", "images/legume2.jpg", "images/legume3.jpg"];

$(document).ready(function()
{
    $(".carousel").css(
    {
        backgroundImage: "url('"+paths[0]+"')",
        backgroundSize: "cover",
        backgroundRepeat: "no-repeat"
    });

    setTimeout(NextBackground, 2000, 0);
});

function NextBackground(index)
{
    if(++index == paths.length)
    {
        index = 0;
    }

    backgroundFadeIn(1000, function()
    {
        $(".carousel").css(
        {
            backgroundImage: "url('"+paths[index]+"')"
        });

        backgroundFadeOut(1000, function()
        {
            setTimeout(NextBackground, 2000, index);
        });
    });
}

function backgroundFadeIn(time, _callback)
{
    $elem = $(".carousel-hider");
    $({op: 0}).animate({op: 1}, 
    {
        duration: time,
        step: function(now) 
        {
            $elem.css(
            {
                backgroundColor: 'rgba(0,0,0,' + now + ')'
            });
        },
        complete: function()
        {
            _callback();
        }
    });
}

function backgroundFadeOut(time, _callback)
{
    $elem = $(".carousel-hider");
    $({op: 1}).animate({op: 0}, 
    {
        duration: time,
        step: function(now) 
        {
            console.log
            $elem.css(
            {
                backgroundColor: 'rgba(0,0,0,' + now + ')'
            });
        },
        complete: function()
        {
            _callback();
        }
    });
}