const addrBtn = document.querySelector('.btn-addr');
const checkIdBtn = document.querySelector('.btn-checkId');
let authBtn = document.querySelector('.btn-auth');
let certiAuthBtn = document.querySelector('.btn-certiAuthKey');
let emailCerti = document.getElementsByName('emailCerti')[0];
//회원가입============================================================================================================
// 다음 우편번호
addrBtn.addEventListener('click', function() {
    daum.postcode.load(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                var addr = ''; // 주소 변수
                var extraAddr = '';
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') {
                    // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {
                    // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr +=
                            extraAddr !== ''
                                ? ', ' + data.buildingName
                                : data.buildingName;
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById('addr1').value = extraAddr;
                } else {
                    document.getElementById('addr1').value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById(
                    'addr1'
                ).value = `${addr} [${data.zonecode}]`;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            },
        }).open();
    });
});

//아이디 중복확인
// checkIdBtn.addEventListener('click', function() {
//     let key = this.previousElementSibling.getAttribute('name');
//     let value = this.previousElementSibling.value;
//     getIsDuplicatedPage(key, value)
//         .then(printIsDuplicated)
//         .catch(printError);
// });

//이메일 중복확인  & 인증번호 받기
authBtn.addEventListener('click', function() {
    let key = this.previousElementSibling.getAttribute('name');
    let value = this.previousElementSibling.value;

    getIsDuplicatedPage(key, value) //이메일 중복검사 ajax 호출
        .then(printIsDuplicated) // success: function(result)
        .then(setCountDown) // if(!result)(중복되지않음) => 타이머 실행
        .then(getAuthCheckPage) // if(!result)(중복되지않음) => 인증번호 발송
        .catch(printError);
});

emailCerti.addEventListener('focus', function() {
    $('.btn--white')
        .css('background-color', '#45b8ac')
        .css('pointer-events', 'visible')
        .css('color', '#fff')
        .css('opacity', 1);
});

//인증번호 확인
certiAuthBtn.addEventListener('click', function() {
    getAuthConfirmPage()
        .then(printAuthConfirm)
        .catch(printError);
});

//회원가입 버튼 클릭
// $('.btn--lg').click(function() {
//     getJoinPage()
//         .then(function() {
//             alert('회원가입이 완료되었습니다. ');
//             location.href = '/mintProject/shop/main/index';
//         })
//         .catch(printError);
// });

//getAuthConfirmPage() 의 sucess result
function printAuthConfirm(result) {
    if (result == 'true') {
        alert('인증이 완료되었습니다. ');
        clearInterval(counter);
    } else alert('인증번호가 잘못되었거나, 시간이 만료되었습니다.');
}

function getJoinPage() {
    return $.ajax({
        type: 'post',
        url: '/mintProject/shop/member/joinOk',
        data: $('#join-form').serialize(),
    });
}

//타이머에 사용하는 함수=============================================================================
let timer, counter;
//이메일 인증 시 시간 제한 3분
function countDown() {
    let min = parseInt(timer / 60);
    let sec = timer % 60;

    if (timer == 0) {
        //제한시간이 지나면 실행중인 루프 종료.
        clearInterval(counter);
    }

    $('.timeCount').text(zeroPad(min, 2) + ':' + zeroPad(sec, 2));
    timer--;
}

//분, 초의 자릿수를 2자리로 맞춤. ex) 2분 9초 => 02:09
function zeroPad(number, width) {
    number = number + '';
    return number.length >= width
        ? number
        : new Array(width - number.length + 1).join('0') + number;
}

function setCountDown(result) {
    if (!result) {
        timer = 60 * 3;
        counter = setInterval(countDown, 1000); //1초마다 반복적으로 countDown() 실행
    }

    return result;
}

const checkJoin = () => {
    const ERROR_COLOR = '#b3130b';
    const SUCESS_COLOR = '#0f851a';

    const idInput = document.getElementById('id');
    const pwdInput = document.getElementById('pwd');
    const repwdInput = document.getElementById('repwd');
    const nameInput = document.getElementById('name');

    const checkContainer = Array.from(document.querySelectorAll('.join-check'));

    const [checkId, checkPwd, checkRepwd, checkName] = checkContainer;

    const checkId1 = document.getElementById('checkId-1');
    const checkId2 = document.getElementById('checkId-2');

    const checkPwd1 = document.getElementById('checkPwd-1');
    const checkPwd2 = document.getElementById('checkPwd-2');

    const checkRepwd1 = document.getElementById('checkRepwd-1');

    const checkName1 = document.getElementById('checkName-1');

    function checkingId() {
        function validateId(id) {
            const idRegExp = /^[a-zA-z0-9]{6,12}$/;
            return idRegExp.test(id);
        }

        idInput.addEventListener('blur', e => {
            const value = e.target.value;
            checkId.style.display = 'block';

            if (validateId(value)) {
                checkId1.style.color = SUCESS_COLOR;
                checkId1.state = true;
            } else {
                checkId1.style.color = ERROR_COLOR;
                checkId1.state = false;
            }

            getIsDuplicatedPage('id', value).then(result => {
                if (!result) {
                    checkId2.style.color = SUCESS_COLOR;
                    checkId2.state = true;
                } else {
                    checkId2.style.color = ERROR_COLOR;
                    checkId2.state = false;
                }
            });
        });
    }
    checkingId();

    function checkingRepwd() {
        repwdInput.addEventListener('blur', () => {
            checkRepwd.style.display = 'block';

            if (pwdInput.value === repwd.value) {
                checkRepwd1.style.color = SUCESS_COLOR;
                checkRepwd1.state = true;
            } else {
                checkRepwd1.style.color = ERROR_COLOR;
                checkRepwd1.state = false;
            }
        });
    }

    checkingRepwd();

    function checkingPwd() {
        function checkLength(pwd) {
            return pwd.length >= 8 && pwd.length <= 16;
        }
        function validatePwd(pwd) {
            const pwdRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{1,}$/;

            return pwdRegExp.test(pwd);
        }

        pwdInput.addEventListener('blur', e => {
            const value = e.target.value;
            let color = '';
            checkPwd.style.display = 'block';

            if (checkLength(value)) {
                color = SUCESS_COLOR;
                checkPwd1.style.color = color;
                checkPwd1.state = true;
            } else {
                color = ERROR_COLOR;
                checkPwd1.style.color = color;
                checkPwd1.state = false;
            }

            if (validatePwd(value)) {
                color = SUCESS_COLOR;
                checkPwd2.style.color = color;
                checkPwd2.state = true;
            } else {
                color = ERROR_COLOR;
                checkPwd2.style.color = color;
                checkPwd2.state = false;
            }
        });

        pwdInput.addEventListener('focus', () => {
            repwdInput.value = '';
            checkRepwd1.style.color = ERROR_COLOR;
            checkRepwd1.state = false;
        });
    }
    checkingPwd();

    function checkingName() {
        nameInput.addEventListener('blur', ({ target }) => {
            const { value } = target;
            console.log(value);

            checkName.style.display = 'block';
            if (value) {
                checkName1.style.color = SUCESS_COLOR;
                checkName1.state = 'true';
            } else {
                checkName1.style.color = ERROR_COLOR;
                checkName1.state = 'false';
            }
        });
    }
    checkingName();

    function submitJoin() {
        const writeBtn = document.getElementById('writeBtn');

        writeBtn.addEventListener('click', () => {
            if (!(checkId1.state && checkId2.state)) {
                idInput.focus();
                checkId.style.display = 'block';
            } else if (!(checkPwd1.state && checkPwd2.state)) {
                pwdInput.focus();
                checkPwd.style.display = 'block';
            } else if (!checkRepwd1.state) {
                repwdInput.focus();
                repwd.style.display = 'block';
            }
        });
    }
    submitJoin();
};
checkJoin();
