-- CreateTable
CREATE TABLE "Sex" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Sex_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AgeCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "AgeCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TargetAudience" (
    "id" SERIAL NOT NULL,
    "sexId" INTEGER NOT NULL,
    "ageCategoryId" INTEGER NOT NULL,

    CONSTRAINT "TargetAudience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BladeType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "BladeType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WeavingType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "WeavingType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Blade" (
    "id" SERIAL NOT NULL,
    "typeId" INTEGER NOT NULL,
    "weavingTypeId" INTEGER NOT NULL,
    "diameter" INTEGER NOT NULL,

    CONSTRAINT "Blade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RingDimensions" (
    "id" SERIAL NOT NULL,
    "tireWidth" INTEGER NOT NULL,

    CONSTRAINT "RingDimensions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EarringDimensions" (
    "id" SERIAL NOT NULL,
    "depth" INTEGER NOT NULL,
    "pinLowering" INTEGER,
    "pinWorkingArea" INTEGER NOT NULL,

    CONSTRAINT "EarringDimensions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductStyle" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductStyle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductTheme" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductTheme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductLockType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductLockType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MetalRaw" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "MetalRaw_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MetalCoating" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "MetalCoating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Color" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Color_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Metal" (
    "id" SERIAL NOT NULL,
    "metalRawId" INTEGER NOT NULL,
    "metalCoatingId" INTEGER NOT NULL,
    "colorId" INTEGER NOT NULL,
    "standard" INTEGER NOT NULL,

    CONSTRAINT "Metal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoneRaw" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "StoneRaw_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CutType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CutType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stone" (
    "id" SERIAL NOT NULL,
    "colorId" INTEGER NOT NULL,
    "stoneRawId" INTEGER NOT NULL,
    "cutTypeId" INTEGER NOT NULL,

    CONSTRAINT "Stone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inlay" (
    "id" SERIAL NOT NULL,
    "stoneId" INTEGER NOT NULL,
    "modelVariantId" INTEGER NOT NULL,
    "count" INTEGER NOT NULL,
    "averageWeight" INTEGER NOT NULL,

    CONSTRAINT "Inlay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" INTEGER NOT NULL,
    "uaid" TEXT NOT NULL,
    "weight" INTEGER NOT NULL,
    "barcode" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SizeModel" (
    "id" SERIAL NOT NULL,
    "modelVariantId" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,
    "averageWeight" INTEGER NOT NULL,

    CONSTRAINT "SizeModel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelMedia" (
    "id" SERIAL NOT NULL,
    "path" TEXT NOT NULL,
    "modelVariantId" INTEGER NOT NULL,

    CONSTRAINT "ModelMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelVariant" (
    "id" SERIAL NOT NULL,
    "productModelId" INTEGER NOT NULL,
    "metalId" INTEGER NOT NULL,

    CONSTRAINT "ModelVariant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductModel" (
    "id" SERIAL NOT NULL,
    "article" TEXT NOT NULL,
    "typeId" INTEGER NOT NULL,
    "targetAudienceId" INTEGER,
    "styleId" INTEGER,
    "themeId" INTEGER,
    "lockTypeId" INTEGER,
    "ringDimensionsId" INTEGER,
    "earringDimensionsId" INTEGER,
    "bladeId" INTEGER,
    "height" INTEGER,
    "width" INTEGER,

    CONSTRAINT "ProductModel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Sex_name_key" ON "Sex"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AgeCategory_name_key" ON "AgeCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "TargetAudience_sexId_ageCategoryId_key" ON "TargetAudience"("sexId", "ageCategoryId");

-- CreateIndex
CREATE UNIQUE INDEX "BladeType_name_key" ON "BladeType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "WeavingType_name_key" ON "WeavingType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Blade_typeId_weavingTypeId_diameter_key" ON "Blade"("typeId", "weavingTypeId", "diameter");

-- CreateIndex
CREATE UNIQUE INDEX "RingDimensions_tireWidth_key" ON "RingDimensions"("tireWidth");

-- CreateIndex
CREATE UNIQUE INDEX "EarringDimensions_depth_pinLowering_pinWorkingArea_key" ON "EarringDimensions"("depth", "pinLowering", "pinWorkingArea");

-- CreateIndex
CREATE UNIQUE INDEX "ProductType_name_key" ON "ProductType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ProductStyle_name_key" ON "ProductStyle"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ProductTheme_name_key" ON "ProductTheme"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ProductLockType_name_key" ON "ProductLockType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "MetalRaw_name_key" ON "MetalRaw"("name");

-- CreateIndex
CREATE UNIQUE INDEX "MetalCoating_name_key" ON "MetalCoating"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Color_name_key" ON "Color"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Metal_metalRawId_metalCoatingId_colorId_standard_key" ON "Metal"("metalRawId", "metalCoatingId", "colorId", "standard");

-- CreateIndex
CREATE UNIQUE INDEX "StoneRaw_name_key" ON "StoneRaw"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CutType_name_key" ON "CutType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Stone_colorId_stoneRawId_cutTypeId_key" ON "Stone"("colorId", "stoneRawId", "cutTypeId");

-- CreateIndex
CREATE UNIQUE INDEX "Inlay_stoneId_modelVariantId_key" ON "Inlay"("stoneId", "modelVariantId");

-- CreateIndex
CREATE UNIQUE INDEX "SizeModel_modelVariantId_size_key" ON "SizeModel"("modelVariantId", "size");

-- CreateIndex
CREATE UNIQUE INDEX "ModelMedia_path_modelVariantId_key" ON "ModelMedia"("path", "modelVariantId");

-- CreateIndex
CREATE UNIQUE INDEX "ModelVariant_productModelId_metalId_key" ON "ModelVariant"("productModelId", "metalId");

-- CreateIndex
CREATE UNIQUE INDEX "ProductModel_article_key" ON "ProductModel"("article");

-- AddForeignKey
ALTER TABLE "TargetAudience" ADD CONSTRAINT "TargetAudience_sexId_fkey" FOREIGN KEY ("sexId") REFERENCES "Sex"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetAudience" ADD CONSTRAINT "TargetAudience_ageCategoryId_fkey" FOREIGN KEY ("ageCategoryId") REFERENCES "AgeCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blade" ADD CONSTRAINT "Blade_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "BladeType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blade" ADD CONSTRAINT "Blade_weavingTypeId_fkey" FOREIGN KEY ("weavingTypeId") REFERENCES "WeavingType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Metal" ADD CONSTRAINT "Metal_metalRawId_fkey" FOREIGN KEY ("metalRawId") REFERENCES "MetalRaw"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Metal" ADD CONSTRAINT "Metal_metalCoatingId_fkey" FOREIGN KEY ("metalCoatingId") REFERENCES "MetalCoating"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Metal" ADD CONSTRAINT "Metal_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stone" ADD CONSTRAINT "Stone_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stone" ADD CONSTRAINT "Stone_stoneRawId_fkey" FOREIGN KEY ("stoneRawId") REFERENCES "StoneRaw"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stone" ADD CONSTRAINT "Stone_cutTypeId_fkey" FOREIGN KEY ("cutTypeId") REFERENCES "CutType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inlay" ADD CONSTRAINT "Inlay_stoneId_fkey" FOREIGN KEY ("stoneId") REFERENCES "Stone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inlay" ADD CONSTRAINT "Inlay_modelVariantId_fkey" FOREIGN KEY ("modelVariantId") REFERENCES "ModelVariant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SizeModel" ADD CONSTRAINT "SizeModel_modelVariantId_fkey" FOREIGN KEY ("modelVariantId") REFERENCES "ModelVariant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelMedia" ADD CONSTRAINT "ModelMedia_modelVariantId_fkey" FOREIGN KEY ("modelVariantId") REFERENCES "ModelVariant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVariant" ADD CONSTRAINT "ModelVariant_productModelId_fkey" FOREIGN KEY ("productModelId") REFERENCES "ProductModel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVariant" ADD CONSTRAINT "ModelVariant_metalId_fkey" FOREIGN KEY ("metalId") REFERENCES "Metal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ProductType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_targetAudienceId_fkey" FOREIGN KEY ("targetAudienceId") REFERENCES "TargetAudience"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_styleId_fkey" FOREIGN KEY ("styleId") REFERENCES "ProductStyle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_themeId_fkey" FOREIGN KEY ("themeId") REFERENCES "ProductTheme"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_lockTypeId_fkey" FOREIGN KEY ("lockTypeId") REFERENCES "ProductLockType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_ringDimensionsId_fkey" FOREIGN KEY ("ringDimensionsId") REFERENCES "RingDimensions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_earringDimensionsId_fkey" FOREIGN KEY ("earringDimensionsId") REFERENCES "EarringDimensions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModel" ADD CONSTRAINT "ProductModel_bladeId_fkey" FOREIGN KEY ("bladeId") REFERENCES "Blade"("id") ON DELETE SET NULL ON UPDATE CASCADE;
