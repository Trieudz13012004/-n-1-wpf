use master
go

SELECT 
    f.name AS ConstraintName,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    OBJECT_NAME(f.referenced_object_id) AS ReferencedTable
FROM sys.foreign_keys AS f
JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'Nhan_Cong'; -- hoặc 'Xuat_Kho'


ALTER TABLE dbo.Nhan_Cong DROP CONSTRAINT FK__Nhan_Cong__ID_Co__0EE3280B;
ALTER TABLE Nhan_Cong
ALTER COLUMN ID_CoSo3 INT NULL;

ALTER TABLE Nhan_Cong
ADD CONSTRAINT FK_NhanCong_ID_CoSo3
FOREIGN KEY (ID_CoSo3) REFERENCES Co_So(ID_CoSo);

ALTER TABLE dbo.Xuat_Kho DROP CONSTRAINT FK__Xuat_Kho__ID_CoS__1590259A;

TRUNCATE TABLE dbo.Vat_Nuoi;

ALTER TABLE dbo.Che_bien
ADD CONSTRAINT FK__Che_bien__ID_Vat__200DB40D FOREIGN KEY (ID_VatNuoi1) REFERENCES Vat_Nuoi(ID_VatNuoi);

ALTER TABLE dbo.Nhan_Cong
ADD CONSTRAINT FK__Nhan_Cong__ID_Co__0EE3280B FOREIGN KEY (ID_CoSo3) REFERENCES Co_So(ID_CoSo);

ALTER TABLE dbo.Xuat_Kho
ADD CONSTRAINT FK__Xuat_Kho__ID_CoS__1590259A FOREIGN KEY (ID_CoSo1) REFERENCES Co_So(ID_CoSo);
