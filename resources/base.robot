*** Settings ***

Documentation       Arquivo base do projeto contendo informações principais
Resource            database.robot
Resource            services.robot
Resource            Messages/rabbit.robot
Library             Python/partner.py
