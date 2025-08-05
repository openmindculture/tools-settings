function myexample_widgets_init() {
register_sidebar( array(
'name'          => esc_html__( 'Sidebar', 'aa' ),
'id'            => 'sidebar-1',
'description'   => esc_html__( 'Add widgets here.', 'aa' ),
'before_widget' => '<section id="%1$s" class="widget %2$s">',
    'after_widget'  => '</section>',
'before_title'  => '<h4 class="widget-title">',
    'after_title'   => '</h4>',
) );
register_sidebar( array(
'name'          => esc_html__( 'Footer 1', 'aa' ),
'id'            => 'footer-1',
'description'   => esc_html__( 'Add widgets here.', 'aa' ),
'before_widget' => '<section id="%1$s" class="widget %2$s">',
    'after_widget'  => '</section>',
'before_title'  => '<h4 class="widget-title">',
    'after_title'   => '</h4>',
) );
register_sidebar( array(
'name'          => esc_html__( 'Footer 2', 'aa' ),
'id'            => 'footer-2',
'description'   => esc_html__( 'Add widgets here.', 'aa' ),
'before_widget' => '<section id="%1$s" class="widget %2$s">',
    'after_widget'  => '</section>',
'before_title'  => '<h4 class="widget-title">',
    'after_title'   => '</h4>',
) );
register_sidebar( array(
'name'          => esc_html__( 'Footer 3', 'aa' ),
'id'            => 'footer-3',
'description'   => esc_html__( 'Add widgets here.', 'aa' ),
'before_widget' => '<section id="%1$s" class="widget %2$s">',
    'after_widget'  => '</section>',
'before_title'  => '<h4 class="widget-title">',
    'after_title'   => '</h4>',
) );
register_sidebar( array(
'name'          => esc_html__( 'Categories 3', 'aa' ),
'id'            => 'categories-3',
'description'   => esc_html__( 'Add widgets here.', 'aa' ),
'before_widget' => '<section id="%1$s" class="widget %2$s">',
    'after_widget'  => '</section>',
'before_title'  => '<h4 class="widget-title">',
    'after_title'   => '</h4>',
) );
}
add_action( 'widgets_init', 'myexample_widgets_init' );