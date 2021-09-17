(function(a) {
    a(".mean-menu").meanmenu({
        meanScreenWidth: "991"
    });
    a(window).on("scroll", function() {
        if (a(this).scrollTop() > 150) {
            a(".navbar-area").addClass("is-sticky")
        } else {
            a(".navbar-area").removeClass("is-sticky")
        }
        var m = a(window).scrollTop();
        if (m > 300) {
            a(".go-top").addClass("active")
        }
        if (m < 300) {
            a(".go-top").removeClass("active")
        }
    });
    a(".offer-slider").owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        mouseDrag: false,
        thumbs: false,
        thumbsPrerendered: true,
        items: 1,
        dots: false,
        autoHeight: true,
        autoplay: true,
        smartSpeed: 1500,
        autoplayHoverPause: true,
        animateOut: "slideOutDown",
        animateIn: "slideInDown",
    });
    a(".product-categories-slider").owlCarousel({
        items: 1,
        loop: true,
        nav: false,
        dots: false,
        autoplay: true,
        autoplayHoverPause: true,
        margin: 0,
        smartSpeed: 1500,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            }
        }
    });
    a(".testimonials-slider").owlCarousel({
        items: 1,
        loop: true,
        margin: 30,
        nav: false,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 3,
            }
        }
    });
    a(".feedback-slider").owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        nav: false,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
    });
    a(".featured-slider").owlCarousel({
        items: 1,
        loop: true,
        nav: false,
        dots: false,
        autoplay: true,
        autoplayHoverPause: true,
        margin: 30,
        smartSpeed: 1500,
        navText: ["<i class='flaticon-left-arrow'></i>", "<i class='flaticon-right-arrow'></i>", ],
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 3,
            },
            992: {
                items: 2,
            },
            1200: {
                items: 3,
            }
        }
    });
    a(".hero-slider").owlCarousel({
        items: 1,
        loop: true,
        margin: 0,
        nav: false,
        dots: true,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        navText: ["<i class='flaticon-left-arrow'></i>", "<i class='flaticon-right-arrow'></i>", ],
    });
    a(".partner-slider").owlCarousel({
        loop: true,
        margin: 30,
        nav: false,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1,
            },
            414: {
                items: 1,
            },
            576: {
                items: 3,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 4,
            },
        },
    });
    a(".related-product").owlCarousel({
        loop: true,
        margin: 30,
        nav: false,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1,
            },
            414: {
                items: 1,
            },
            576: {
                items: 2,
            },
            768: {
                items: 2,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 4,
            },
        },
    });
    a(".go-top").on("click", function() {
        a("html, body").animate({
            scrollTop: "0"
        }, 50)
    });
    a(".accordion").find(".accordion-title").on("click", function() {
        a(this).toggleClass("active");
        a(this).next().slideToggle("fast");
        a(".accordion-content").not(a(this).next()).slideUp("fast");
        a(".accordion-title").not(a(this)).removeClass("active")
    });
    function f() {
        var n = new Date("november  30, 2021 17:00:00 PDT");
        var n = (Date.parse(n)) / 1000;
        var q = new Date();
        var q = (Date.parse(q) / 1000);
        var s = n - q;
        var m = Math.floor(s / 86400);
        var o = Math.floor((s - (m * 86400)) / 3600);
        var p = Math.floor((s - (m * 86400) - (o * 3600)) / 60);
        var r = Math.floor((s - (m * 86400) - (o * 3600) - (p * 60)));
        if (o < "10") {
            o = "0" + o
        }
        if (p < "10") {
            p = "0" + p
        }
        if (r < "10") {
            r = "0" + r
        }
        a("#days").html(m + "<span>Days</span>");
        a("#hours").html(o + "<span>Hours</span>");
        a("#minutes").html(p + "<span>Minutes</span>");
        a("#seconds").html(r + "<span>Seconds</span>")
    }
    setInterval(function() {
        f()
    }, 300);
    a(window).on("load", function() {
        a(".preloader").addClass("preloader-deactivate")
    });
    a(".newsletter-form").validator().on("submit", function(m) {
        if (m.isDefaultPrevented()) {
            d();
            g(false, "Please enter your email correctly.")
        } else {
            m.preventDefault()
        }
    });
    function c(m) {
        if (m.result === "success") {
            e()
        } else {
            d()
        }
    }
    function e() {
        a(".newsletter-form")[0].reset();
        g(true, "Thank you for subscribing!");
        setTimeout(function() {
            a("#validator-newsletter").addClass("hide")
        }, 4000)
    }
    function d() {
        a(".newsletter-form").addClass("animated shake");
        setTimeout(function() {
            a(".newsletter-form").removeClass("animated shake")
        }, 1000)
    }
    function g(o, m) {
        if (o) {
            var n = "validation-success"
        } else {
            var n = "validation-danger"
        }
        a("#validator-newsletter, #validator-newsletter-2").removeClass().addClass(n).text(m)
    }
    a(".newsletter-form").ajaxChimp({
        url: "https://Envy Theme.us20.list-manage.com/subscribe/post?u=60e1ffe2e8a68ce1204cd39a5&amp;id=42d6d188d9",
        callback: c
    });
    a(".others-option-for-responsive .dot-menu").on("click", function() {
        a(".others-option-for-responsive .container .container").toggleClass("active")
    });
    if (a(".wow").length) {
        var l = new WOW({
            mobile: false
        });
        l.init()
    }
    a(".burger-menu").on("click", function() {
        a(".sidebar-modal").toggleClass("active")
    });
    a(".sidebar-modal-close-btn").on("click", function() {
        a(".sidebar-modal").removeClass("active")
    });
    a("#range-slider").slider({
        range: true,
        min: 500,
        max: 10000,
        values: [500, 10000],
        slide: function(m, n) {
            a("#price-amount").val("$" + n.values[0] + " - $" + n.values[1])
        }
    });
    a("#price-amount").val("$" + a("#range-slider").slider("values", 0) + " - $" + a("#range-slider").slider("values", 1));
    a(".accordion-widget").find(".accordion-widget-title").on("click", function() {
        a(this).toggleClass("active");
        a(".accordion-widget-content").toggleClass("open");
        a(this).next().slideToggle("800")
    });
    a(".tab ul.tabs").addClass("active").find("> li:eq(0)").addClass("current");
    a(".tab ul.tabs li").on("click", function(m) {
        var o = a(this).closest(".tab")
          , n = a(this).closest("li").index();
        o.find("ul.tabs > li").removeClass("current");
        a(this).closest("li").addClass("current");
        o.find(".tab_content").find("div.tabs_item").not("div.tabs_item:eq(" + n + ")").slideUp();
        o.find(".tab_content").find("div.tabs_item:eq(" + n + ")").slideDown();
        m.preventDefault()
    });
    a(".input-counter").each(function() {
        var r = jQuery(this)
          , o = r.find('input[type="text"]')
          , n = r.find(".plus-btn")
          , m = r.find(".minus-btn")
          , q = o.attr("min")
          , p = o.attr("max");
        n.on("click", function() {
            var t = parseFloat(o.val());
            if (t >= p) {
                var s = t
            } else {
                var s = t + 1
            }
            r.find("input").val(s);
            r.find("input").trigger("change")
        });
        m.on("click", function() {
            var t = parseFloat(o.val());
            if (t <= q) {
                var s = t
            } else {
                var s = t - 1
            }
            r.find("input").val(s);
            r.find("input").trigger("change")
        })
    });
    var b = a("#big");
    var k = a("#thumbs");
    var h = true;
    b.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: true,
        autoplay: true,
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
        navText: ["<i class='bx bx-left-arrow-alt'></i>", "<i class='bx bx-right-arrow-alt'></i>", ]
    }).on("changed.owl.carousel", i);
    k.on("initialized.owl.carousel", function() {
        k.find(".owl-item").eq(0).addClass("current")
    }).owlCarousel({
        items: 5,
        dots: false,
        nav: false,
        navText: ["<i class='bx bx-left-arrow-alt'></i>", "<i class='bx bx-right-arrow-alt'></i>", ],
        smartSpeed: 200,
        slideSpeed: 500,
        slideBy: 4,
        responsiveRefreshRate: 100
    }).on("changed.owl.carousel", j);
    function i(o) {
        var m = o.item.count - 1;
        var n = Math.round(o.item.index - o.item.count / 2 - 0.5);
        if (n < 0) {
            n = m
        }
        if (n > m) {
            n = 0
        }
        k.find(".owl-item").removeClass("current").eq(n).addClass("current");
        var q = k.find(".owl-item.active").length - 1;
        var r = k.find(".owl-item.active").first().index();
        var p = k.find(".owl-item.active").last().index();
        if (n > p) {
            k.data("owl.carousel").to(n, 100, true)
        }
        if (n < r) {
            k.data("owl.carousel").to(n - q, 100, true)
        }
    }
    function j(m) {
        if (h) {
            var n = m.item.index;
            b.data("owl.carousel").to(n, 100, true)
        }
    }
    k.on("click", ".owl-item", function(m) {
        m.preventDefault();
        var n = a(this).index();
        b.data("owl.carousel").to(n, 300, true)
    })
}
)(jQuery);
