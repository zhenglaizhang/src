for (i = 0; i < 1000000; i ++) {
    db.users.insert(
        {
	    "i": i,
	    "username": "user"+i,
	    "age":Math.floor(Math.random()*120),
	    "created": new Date()
        }
    );
    print('user ' + i + ' created');
}
