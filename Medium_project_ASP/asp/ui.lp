#const root_name="ROOT".

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    % Main window
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elem(w, window, root).
    attr(w,"overflow-x","hidden").

    % Style label
    elem(header,label,w).
    attr(header,label,"Choose your features").
    attr(header, "font-family", ("Courier new")).
    attr(header, "font-style", "italic").
    attr(header, "font-size", "2rem").
    attr(header, "position", "absolute").
    attr(header, "width", "99%").
    attr(header, "top", "35px").
    attr(header, "left", "10px").
    attr(header, "background-cover", "fit").

    % Background image
    elem(img1, container, w).
    attr(img1, height, "83vh").
    attr(img1, width, "98%").
    attr(img1, class, ("m-0";"pt-4";"p-0";"bg-white";"d-flex";"justify-content-start";"align-items-center";"position-absolute";"rounded")).
    attr(img1, "background-position", "0 -225px").
    attr(img1, "background-size", "100%").
    attr(img1, "background-image", "url('https://images.unsplash.com/photo-1507035895480-2b3156c31fc8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')").
    attr(img1, "background-repeat", "no-repeat").

    elem(msg,message,w).
    attr(msg, title,"Download Information!").
    attr(msg, message,"Please click SELECT to download!").
    attr(msg, type,"light").
    attr(msg, class,"p-5").
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    % Menu bar
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elem(menu_bar, menu_bar, w). 
    attr(menu_bar, title, "Product Configuration").
    attr(menu_bar, icon, "fa-bicycle"). 


    % Clear assumptions
    elem(menu_bar_clear, button, menu_bar).
    attr(menu_bar_clear, label, "Clear").
    attr(menu_bar_clear, icon, "fa-trash").
    attr(menu_bar_clear, class, ("btn-outline-danger";"border-0")).
    when(menu_bar_clear, click, callback, clear_assumptions).

    % Select solution
    elem(menu_bar_select, button, menu_bar).
    attr(menu_bar_select, label, "SELECT").
    attr(menu_bar_select, icon, "fa-check-circle").
    attr(menu_bar_select, class, ("btn-outline-success";"border-0")).
    when(menu_bar_select, click, callback, select).

    % Download solution
    elem(menu_bar_download, button, menu_bar).
    attr(menu_bar_download, label, "Download").
    attr(menu_bar_download, icon, "fa-download").
    when(menu_bar_download, click, update, (modal, visible, shown)).

    % one container per feature
    elem(c(F), container, img1) :- feature(root_name,F,T,_,_).
    attr(c(F), width, "500") :- feature(root_name,F,T,_,_).
    attr(c(F), class, ("m-3";"p-3";"bg-dark";"bg-opacity-25";"rounded"; "justify-content-center")):- feature(root_name,F,T,_,_).
    attr(c(F), class, ("d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,_,_).

     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    % Title
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        elem(l(F), label, c(F)) :- feature(root_name,F,T,_,_).
        attr(l(F), label, F) :- feature(root_name,F,T,_,_).
        attr(l(F), class,("text-uppercase")):- feature(root_name,F,T,_,_).
        attr(l(F), "font-style", "italic"):- feature(root_name,F,T,_,_).
        attr(l(F), "letter-spacing", "2px"):- feature(root_name,F,T,_,_).
        attr(l(F), "font-size", "20px"):- feature(root_name,F,T,_,_).
        attr(l(F), "font-family", ("Garamond")):- feature(root_name,F,T,_,_).
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    % Dropdown menu 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,_,_).
        attr(ldd(F), class, ("bg-opacity-75")) :- feature(root_name,F,T,_,_).

        % select V for F if all answer sets have value V for F
        attr(ldd(F), selected, V) :- feature(root_name,F,T,_,_), _all(value(F,V)).
        attr(ldd(F), "letter-spacing", "2px") :- feature(root_name,F,T,_,_), _all(value(F,V)).

            % otherwise allow the selection of V for F if any answer set has value V for V  
            elem(lddi(F,V), dropdown_menu, ldd(F)) :- feature(root_name,F,T,_,_), option(T,V).                          %allow for every value to be visible

            attr(lddi(F,V), label, V) :- feature(root_name,F,T,_,_), option(T,V).
            attr(lddi(F,V), "letter-spacing", "2px"):- _any(value(F,V)).
            attr(lddi(F,V), class, ("text-danger")):- feature(root_name,F,T,_,_), not _any(value(F,V)), option(T,V).    %change color of value to red if feature isn't part of solution
            
            % if option (F,V) is selected then add the assumption that value(F,T) must hold
            when(lddi(F,V), click, call, select()) :-  _any(value(F,V)).

            % Remove assumptions from dropdown menu
            elem(remove(F,V), dropdown_menu_item, ldd(F) ):- _all(value(F,V)).
            attr(remove(F,V), icon, ("fa-ban")):- _all(value(F,V)).
            when(remove(F,V), click, call, remove_assumption(value(F,V))):- _any(value(F,V)).
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

