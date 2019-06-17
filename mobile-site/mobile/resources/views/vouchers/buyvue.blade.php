<script>
	var buy_form = new Vue({
	el: '#buy_form',
	data:{
		total: 5,
		amount:0
	},
	methods: {
		totalize : function(evt){
			this.total =  (evt.target.value * 5).toFixed(2); 
		},
		
	}
});
</script>