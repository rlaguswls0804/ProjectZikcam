<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8" />
    </head>
   
    <body>
        <!-- Responsive navbar-->
        
        <!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav> -->
        
        <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">ZikCam</a>
                <img src="images/zikcam_black.png" alt="ZikCam_Logo" width="130" height="30">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">쇼핑하기</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><h5 class="dropdown-header" href="#!">대여</h5></li>
                                <li><a class="dropdown-item" href="#!">텐트 / 타프</a></li>
                                <li><a class="dropdown-item" href="#!">매트 / 침낭</a></li>
                                <li><a class="dropdown-item" href="#!">테이블 / 체어</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><h5 class="dropdown-header" href="#!">구매</h5></li>
                                <li><a class="dropdown-item" href="#!">텐트 / 타프</a></li>
                                <li><a class="dropdown-item" href="#!">매트 / 침낭</a></li>
                                <li><a class="dropdown-item" href="#!">테이블 / 체어</a></li>
                                <li><a class="dropdown-item" href="#!">기타</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav> -->
        
        
        <!-- Header-->
        <header class="py-5">
            <div class="container px-lg-5">
                <div class="p-4 p-lg-5 bg-light rounded-3 text-center">
                    <div class="m-4 m-lg-5">
                        <h1 class="display-5 fw-bold">ZikCam 고객센터</h1>
                        <p class="fs-4">ZikCam의 고객센터에 오신 것을 환영합니다.</p>
                        <a class="btn btn-primary btn-lg" href="/zikcam/cs/introList">직캠 소개</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- Page Content-->
        <section class="pt-4">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-xxl-4 mb-5" onclick="location.href='/zikcam/cs/qnaList'">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                <h2 class="fs-4 fw-bold">직캠에 문의하기</h2>
                                <p class="mb-0">직캠에 문의사항을 남겨주세요</p>
                            </div>
                        </div>
                    </div>
                  	<div class="col-lg-6 col-xxl-4 mb-5" onclick="location.href='/zikcam/cs/faqList'">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                                <h2 class="fs-4 fw-bold">FAQ</h2>
                                <p class="mb-0">자주 묻는 질문을 정리했습니다</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6 col-xxl-4 mb-5" onclick="location.href='/zikcam/cs/noticeList'">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                                <h2 class="fs-4 fw-bold">직캠 소식</h2>
                                <p class="mb-0">직캠 소식을 알아보세요</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div>
                                <h2 class="fs-4 fw-bold">Simple clean code</h2>
                                <p class="mb-0">We keep our dependencies up to date and squash bugs as they come!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                                <h2 class="fs-4 fw-bold">A name you trust</h2>
                                <p class="mb-0">Start Bootstrap has been the leader in free Bootstrap templates since 2013!</p>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </section>
        <!-- Footer-->
       <!--  <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer> -->
        
    </body>
</html>
