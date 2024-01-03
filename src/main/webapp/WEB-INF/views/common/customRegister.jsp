<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <!-- Bootstrap css -->
    <link href="${pageContext.request.contextPath}/resources/common/styles.css?ver=1" rel="stylesheet">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- jQuery cdn-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

    <style>
        body {
            min-height: 100vh;
        }

        .input-form {
            max-width: 680px;
            margin-top: 80px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
    </style>
</head>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h2 class="mb-3">천재샵 회원가입</h2>
            <hr class="mb-4">
            <form:form modelAttribute="registerFormDTO" action="${pageContext.request.contextPath}/register"
                       class="validation-form" novalidate="true">
                <h4 style="margin-bottom: 20px"><form:errors path="globalError" cssClass="text-danger"/></h4>
                <div class="mb-3">
                    <label for="id">아이디</label>
                    <form:input path="id" type="text" class="form-control" placeholder="아이디를 입력해주세요" required="true"/>
                    <div class="invalid-feedback">
                        아이디를 입력해주세요 (영문 소문자 및 숫자를 사용해서 최소 5자 최대 15자까지 가능합니다)
                    </div>
                    <div>
                        <span id="id-check-span"></span>
                    </div>
                    <div>
                        <form:errors path="id" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email">이름</label>
                    <form:input path="name" type="text" class="form-control" placeholder="이름을 입력해주세요" required="true"/>
                    <div class="invalid-feedback">
                        이름을 입력해주세요
                    </div>
                    <div>
                        <form:errors path="name" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email">이메일</label>
                    <form:input path="email" type="email" class="form-control" placeholder="example@example.com"
                                required="true"/>
                    <div class="invalid-feedback">
                        이메일을 입력해주세요
                    </div>
                    <div>
                        <form:errors path="email" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="password1">비밀번호</label>
                    <form:input path="password1" type="password" class="form-control" placeholder="비밀번호를 입력해주세요"
                                required="true"/>
                    <div class="invalid-feedback">
                        비밀번호를 입력해주세요
                    </div>
                    <div>
                        <form:errors path="password1" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="password2">비밀번호 확인</label>
                    <form:input path="password2" type="password" class="form-control" placeholder="비밀번호를 재입력해주세요"
                                required="true"/>
                    <div class="invalid-feedback">
                        비밀번호를 다시 한 번 입력해주세요
                    </div>
                    <div>
                        <form:errors path="password2" cssClass="text-danger"/>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="phone">전화번호</label>
                    <form:input path="phone" type="text" class="form-control" placeholder="'-' 기호 없이 숫자만 입력해주세요"
                                required="true"/>
                    <div class="invalid-feedback">
                        전화번호를 입력해주세요 (- 기호를 제외한 숫자만 입력해주세요)
                    </div>
                    <div>
                        <form:errors path="phone" cssClass="text-danger"/>
                    </div>
                </div>
                <div>
                    <div class="mb-3">
                        <button type="button" class="btn btn-link"
                                onclick="sample6_execDaumPostcode()">주소검색
                        </button>
                    </div>
                    <div class="mb-3">
                        <label for="zipcode">우편번호</label>
                        <form:input path="zipcode" type="text" class="form-control" placeholder="주소 검색을 해주세요"
                                    readonly="true"/>
                        <div class="invalid-feedback">
                            주소 검색을 통해 우편번호가 자동 입력되도록 해주세요
                        </div>
                        <div>
                            <form:errors path="zipcode" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="address1">주소</label>
                        <form:input path="address1" type="text" class="form-control" placeholder="주소 검색을 해주세요"
                                    readonly="true"/>
                        <div class="invalid-feedback">
                            주소 검색을 통해 주소가 자동 입력되도록 해주세요
                        </div>
                        <div>
                            <form:errors path="address1" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="address2">상세주소</label>
                        <form:input path="address2" type="text" class="form-control" placeholder="상세 주소를 입력해주세요 (동/호수)"
                                    required="true"/>
                        <div class="invalid-feedback">
                            상세 주소를 입력해주세요
                        </div>
                        <div>
                            <form:errors path="address2" cssClass="text-danger"/>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="type">회원구분</label>
                    <form:select path="type" class="form-select" required="true">
                        <form:option value="">회원구분 선택</form:option>
                        <form:option value="customer">고객</form:option>
                        <form:option value="seller">판매자</form:option>
                    </form:select>
                    <div class="invalid-feedback">
                        회원구분 중 하나를 선택해주세요
                    </div>
                    <div>
                        <form:errors path="type" cssClass="text-danger"/>
                    </div>
                </div>
                <hr class="mb-4">
                <div>
                    <button class="btn btn-primary" type="submit">회원가입하기</button>
                </div>
            </form:form>
        </div>
    </div>
    <footer class="my-3 text-center text-small">
        <p class="mb-1">&copy; 2023 Chunjaeshop, all rights reserved</p>
    </footer>
</div>

<script>
    let idCheck = false;

    $(document).ready(function () {
        console.log('ready');

        $('#id').keyup(function () {
            console.log('id tag key up event');
            console.log($('#id').val());
            let userInputId = $('#id').val();
            if (userInputId.length >= 5 && userInputId.length <= 15) {
                console.log('call idDuplicateCheckAjax')
                idDuplicateCheckAjax();
                if (idCheck) {
                    $('#id-check-span').html('사용할 수 있는 아이디입니다');
                } else {
                    $('#id-check-span').html('이미 사용 중인 아이디입니다');
                }
            }
        })
    });
    let idDuplicateCheckAjax = function () {
        $.ajax({
            url: '${pageContext.request.contextPath}' + '/register/id-duplicate-check',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            dataType: 'text/plain',
            data: {
                id: $('#id').val(),
            },
            async: false,
            success: function (result) {
                if (result == 'canuse') idCheck = true;
                else idCheck = false;
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>

<script>
    /*window.addEventListener("load", () => {
        const form = document.getElementById("registerFormDTO");
        form.addEventListener("submit", function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add("was-validated");
        }, false);
    }, false);*/
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';
                var extraAddr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr;

                }
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
</body>
</html>
