//사업자가입할때 쓰는 우편검색 
function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('Cw_postnumber').value = data.zonecode;
                document.getElementById('Cw_address1').value = fullAddr;

                document.getElementById('Cw_address1').focus();
            }
        }).open();
    }
 
//사업자정보수정할때 쓰는 우편검색
 function modifyPostcode(){
	 new daum.Postcode({
         oncomplete: function(data) {
             var fullAddr = '';
             var extraAddr = '';

             if (data.userSelectedType === 'R') {
                 fullAddr = data.roadAddress;
             }else {
                 fullAddr = data.jibunAddress;
             }

             if(data.userSelectedType === 'R'){
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             document.getElementById('C-modify-postnumber').value = data.zonecode;
             document.getElementById('C-modify-address1').value = fullAddr;
             document.getElementById('C-modify-address2').value = "";
             document.getElementById('C-modify-address2').focus();
         }
     }).open();
 }