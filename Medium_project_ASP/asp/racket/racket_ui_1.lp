#const root_name="ROOT".

%*
cd /Users/mymac/Downloads/Medium_project_ASP/asp/racket
clinguin client-server --domain-files racket_configuration_1.lp racket.lp --ui-files racket_ui_1.lp
*%

% main window
    elem(w, window, root).
    elem(main_container, container, w).
    attr(main_container, position, "relative").
    attr(main_container, height, "83vh").
    attr(main_container, width, "100%").
    attr(main_container, class, ("m-0";"pt-4";"p-0";"bg-white";"rounded"; )).
    attr(main_container, "background-position", "0 0").
    attr(main_container, "background-size", "100%").
    attr(main_container, "background-image", "url('https://plus.unsplash.com/premium_photo-1664304787554-8191fb0832fb?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')").
    attr(main_container, "background-repeat", "no-repeat").

% Choose your features heading
    elem(choose_your_features_heading_label,label,w).
    attr(choose_your_features_heading_label,label,"Design your racket").
    attr(choose_your_features_heading_label, "font-family", ("Courier New")).
    attr(choose_your_features_heading_label, "font-style", "italic").
    attr(choose_your_features_heading_label, "font-size", "3rem").
    attr(choose_your_features_heading_label, "position", "absolute").
    attr(choose_your_features_heading_label, "width", "99%").
    attr(choose_your_features_heading_label, "top", "7%").

    % title
    elem(menu_bar, menu_bar, w). 
    attr(menu_bar, title, "Racket configuration").
    attr(menu_bar, icon, "fa-table-tennis-paddle-ball"). 

    % Clear button 
    elem(menu_bar_clear, button, menu_bar).
    attr(menu_bar_clear, label, "Clear selections").
    attr(menu_bar_clear, icon, "fa-trash").
    attr(menu_bar_clear, class, ("btn-outline-danger";"border-0")).
    when(menu_bar_clear, click, callback, clear_assumptions).


    % Download button
    elem(menu_bar_download, button, menu_bar).
    attr(menu_bar_download, label, "Download").
    attr(menu_bar_download, icon, "fa-download").
    when(menu_bar_download, click, call, download).

    % Three columns stuff
    % Main subcontainer for 3 columns
    elem(sub_container_main,container,main_container).
    attr(sub_container_main,child_layout, "flex").
    attr(sub_container_main,flex_direction, "row").


    % 3 subcontainers one for each column
    elem(sub_container_1,container,sub_container_main).
    elem(sub_container_2,container,sub_container_main).
    elem(sub_container_3,container,sub_container_main).

    attr(sub_container_main,width,"100%").
    attr(sub_container_main,height,"100%").
    attr(sub_container_main,padding,"10px").
    attr(sub_container_main,class,"d-flex align-self").
    attr(sub_container_1,width,"33.333333%").
    attr(sub_container_2,width,"33.333333%").
    attr(sub_container_3,width,"33.333333%").




%%%%%%%%%%%%%%%%%%%%%%%%% sub container 1 %%%%%%%%%%%%%%%%%%%%%%%%%

    % one container per feature
    elem(c(F), container, sub_container_1) :- feature(root_name,F,T,1,_).
    attr(c(F), width, "90%") :- feature(root_name,F,T,1,_).
    attr(c(F), class, ("m-3";"p-3";"bg-dark";"bg-opacity-25";"rounded"; "justify-content-center")):- feature(root_name,F,T,1,_).
    attr(c(F), class, ("d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,1,_).


        % label
        elem(l(F), label, c(F)) :- feature(root_name,F,T,1,_).
        attr(l(F), label, F) :- feature(root_name,F,T,1,_).
        attr(l(F), class,("text-uppercase")):- feature(root_name,F,T,1,_).
        attr(l(F), "font-style", "italic"):- feature(root_name,F,T,1,_).
        attr(l(F), "letter-spacing", "2px"):- feature(root_name,F,T,1,_).
        attr(l(F), "font-size", "20px"):- feature(root_name,F,T,1,_).
        attr(l(F), "font-family", ("Garamond")):- feature(root_name,F,T,1,_).

        % dropdown menu
        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,1,_).
        attr(ldd(F), class, ("bg-opacity-75")) :- feature(root_name,F,T,1,_).

        % select V for F if all answer sets have value V for F
        attr(ldd(F), selected, V) :- feature(root_name,F,T,1,_), _all(value(F,V)).
        attr(ldd(F), "letter-spacing", "2px") :- feature(root_name,F,T,1,_), _all(value(F,V)).
        % attr(l(F,V),class,("text-danger")):- not _any(value(F,V)).

            % otherwise allow the selection of V for F if any answer set has value V for V
            elem(lddi(F,V), dropdown_menu, ldd(F)) :- feature(root_name,F,T,1,_), _any(value(F,V)).
            attr(lddi(F,V), label, V) :- feature(root_name,F,T,1,_), _any(value(F,V)).
            attr(lddi(F,V), "letter-spacing", "2px"):- feature(root_name,F,T,1,_), _any(value(F,V)).

            % if option (F,V) is selected then add the assumption that value(F,T) must hold
            when(lddi(F,V), click, call, add_assumption(value(F,V))) :-  _any(value(F,V)). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%% sub container 2 %%%%%%%%%%%%%%%%%%%%%%%%%
    elem(c(F), container, sub_container_2) :- feature(root_name,F,T,2,_).
    attr(c(F), width, "90%") :- feature(root_name,F,T,2,_).
    attr(c(F), class, ("m-3";"p-3";"bg-dark";"bg-opacity-25";"rounded"; "justify-content-center")):- feature(root_name,F,T,2,_).
    attr(c(F), class, ("d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,2,_).

        % label
        elem(l(F), label, c(F)) :- feature(root_name,F,T,2,_).
        attr(l(F), label, F) :- feature(root_name,F,T,2,_).
        attr(l(F), class,("text-uppercase")):- feature(root_name,F,T,2,_).
        attr(l(F), "font-style", "italic"):- feature(root_name,F,T,2,_).
        attr(l(F), "letter-spacing", "2px"):- feature(root_name,F,T,2,_).
        attr(l(F), "font-size", "20px"):- feature(root_name,F,T,2,_).
        attr(l(F), "font-family", ("Garamond")):- feature(root_name,F,T,2,_).

        % dropdown menu
        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,2,_).
        attr(ldd(F), class, ("bg-opacity-75")) :- feature(root_name,F,T,2,_).

        % select V for F if all answer sets have value V for F
        attr(ldd(F), selected, V) :- feature(root_name,F,T,2,_), _all(value(F,V)).
        attr(ldd(F), "letter-spacing", "2px") :- feature(root_name,F,T,2,_), _all(value(F,V)).

            % otherwise allow the selection of V for F if any answer set has value V for V
            elem(lddi(F,V), dropdown_menu, ldd(F)) :- feature(root_name,F,T,2,_), _any(value(F,V)).
            attr(lddi(F,V), label, V) :- feature(root_name,F,T,2,_), _any(value(F,V)).
            attr(lddi(F,V), "letter-spacing", "2px"):- feature(root_name,F,T,2,_), _any(value(F,V)).
            attr(lddi(F,V), "font-style", "italic") :- _any(value(F,V)).

            % if option (F,V) is selected then add the assumption that value(F,T) must hold
            when(lddi(F,V), click, call, add_assumption(value(F,V))) :- feature(root_name,F,T,2,_), _any(value(F,V)).
            elem(remove(F,V), dropdown_menu_item, ldd(F) ):- _all(value(F,V)).
            attr(remove(F,V), icon, ("fa-ban")):- _all(value(F,V)).
            when(remove(F,V), click, call, remove_assumption(value(F,V))):- _any(value(F,V)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%% sub container 3 %%%%%%%%%%%%%%%%%%%%%%%%%
    elem(c(F), container, sub_container_3) :- feature(root_name,F,T,3,_).
    attr(c(F), width, "90%") :- feature(root_name,F,T,3,_).
    attr(c(F), class, ("m-3";"p-3";"bg-dark";"bg-opacity-25";"rounded"; "justify-content-center")):- feature(root_name,F,T,3,_).
    attr(c(F), class, ("d-inline-flex";"flex-row-reverse";"justify-content-between")) :- feature(root_name,F,T,3,_).

        % label
        elem(l(F), label, c(F)) :- feature(root_name,F,T,3,_).
        attr(l(F), label, F) :- feature(root_name,F,T,3,_).
        attr(l(F), class,("text-uppercase")):- feature(root_name,F,T,3,_).
        attr(l(F), "font-style", "italic"):- feature(root_name,F,T,3,_).
        attr(l(F), "letter-spacing", "2px"):- feature(root_name,F,T,3,_).
        attr(l(F), "font-size", "20px"):- feature(root_name,F,T,3,_).
        attr(l(F), "font-family", ("Garamond")):- feature(root_name,F,T,3,_).

        % dropdown menu
        elem(ldd(F), dropdown_menu, c(F)) :- feature(root_name,F,T,3,_).
        attr(ldd(F), class, ("bg-opacity-75")) :- feature(root_name,F,T,3,_).

        % select V for F if all answer sets have value V for F
        attr(ldd(F), selected, V) :- feature(root_name,F,T,3,_), _all(value(F,V)).
        attr(ldd(F), "letter-spacing", "2px") :- feature(root_name,F,T,3,_), _all(value(F,V)).

            % otherwise allow the selection of V for F if any answer set has value V for V
            elem(lddi(F,V), dropdown_menu, ldd(F)) :- feature(root_name,F,T,3,_), _any(value(F,V)).
            attr(lddi(F,V), label, V) :- feature(root_name,F,T,3,_), _any(value(F,V)).
            attr(lddi(F,V), "letter-spacing", "2px"):- feature(root_name,F,T,3,_), _any(value(F,V)).
            attr(lddi(F,V), "font-style", "italic") :- _any(value(F,V)).
            % if option (F,V) is selected then add the assumption that value(F,T) must hold
            when(lddi(F,V), click, call, add_assumption(value(F,V))) :- feature(root_name,F,T,3,_), _any(value(F,V)).

            elem(remove(F,V), dropdown_menu_item, ldd(F) ):- _all(value(F,V)).
            attr(remove(F,V), icon, ("fa-ban")):- _all(value(F,V)).
            when(remove(F,V), click, call, remove_assumption(value(F,V))):- _any(value(F,V)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
