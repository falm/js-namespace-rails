JsSpace.on('users', {
  init(){
    $('.common-place').text('common_action_works')
  },
  index(){
    $('.title').text('user_list');
    var puts = ['user_id', this.params.user_id, 'user_name', this.params.user_name].join(':');
    $('.common-place').append(puts);
  },
  _new(){
    $('.h1-title').text('new_user');
  },
  show(){
    $('.common-place').append('show-user');
    $('.common-place').append(this.params.message);
  }
});