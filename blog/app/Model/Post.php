<?php
class Post extends AppModel {
    public $validate = array(
        'title' => array(
            'rule' => 'notEmpty'
        ),
        'body' => array(
            'rule' => 'notEmpty'
        )
    );
}

/**
 * Created by JetBrains PhpStorm.
 * User: groyce
 * Date: 5/14/13
 * Time: 3:17 PM
 * To change this template use File | Settings | File Templates.
 */