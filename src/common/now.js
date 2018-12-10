import ajax from 'packing-ajax';

ajax({
  url: '/api/now',
  success: (data) => {
    console.log(`🕑 --> ${data.now}`);
  }
});
